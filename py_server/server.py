from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
from itertools import permutations
from sklearn.cluster import MiniBatchKMeans
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.spatial.distance import pdist, squareform
from kneed import KneeLocator
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

# Initialize global variables
coordinates = pd.DataFrame(columns=['lat', 'long']) #store lat and longi
streaming_data = []#store incoming data points
remaining_data = pd.DataFrame(columns=['lat', 'long'])#Stores the initial dataset and dynamically adds new points.

starting_point = np.array([[0.0, 0.0]])
initial_k = 5  # Number of clusters

'''def initialize_clusters():
    global remaining_data, mb_kmeans
    mb_kmeans = MiniBatchKMeans(n_clusters=initial_k, random_state=42, batch_size=10)
    remaining_data['cluster'] = mb_kmeans.fit_predict(remaining_data)
'''
# Elbow method to find the optimal number of clusters
def initialize_clusters():
    global remaining_data, mb_kmeans  # Use global keyword for shared variables
    inertia = []
    k_values = range(1, 11)

    for k in k_values:
        kmeans = MiniBatchKMeans(n_clusters=k, random_state=42, batch_size=10)
        kmeans.fit(coordinates)
        inertia.append(kmeans.inertia_)

    knee = KneeLocator(k_values, inertia, curve="convex", direction="decreasing")
    optimal_k_elbow = knee.knee

    print(f"Optimal number of clusters (Elbow Method): {optimal_k_elbow}")

    # Apply MiniBatchKMeans with the optimal number of clusters
    optimal_k = optimal_k_elbow
    mb_kmeans = MiniBatchKMeans(n_clusters=optimal_k, random_state=42, batch_size=10)
    remaining_data['cluster'] = mb_kmeans.fit_predict(remaining_data)


# Function to solve TSP with a starting point
def tsp_with_start(distance_matrix):
    n = distance_matrix.shape[0]
    all_permutations = permutations(range(1, n))  # Exclude the starting point from permutations
    shortest_path = None
    min_distance = float('inf')

    for perm in all_permutations:
        full_path = (0,) + perm + (0,)
        current_distance = sum(distance_matrix[full_path[i], full_path[i + 1]] for i in range(len(full_path) - 1))

        if current_distance < min_distance:
            min_distance = current_distance
            shortest_path = full_path

    return shortest_path, min_distance

@app.route('/update_location', methods=['POST'])
def update_location():
    global remaining_data, mb_kmeans

    # Get new location from the request
    new_point = request.json
    lat, long = new_point['lat'], new_point['long']
    print(f"Received new point: {lat}, {long}")

    # Add new point to remaining data
    new_data = pd.DataFrame([[lat, long]], columns=['lat', 'long'])
    remaining_data = pd.concat([remaining_data, new_data], ignore_index=True)

    # Update MiniBatchKMeans with new data
    mb_kmeans.partial_fit(remaining_data[['lat', 'long']])
    remaining_data['cluster'] = mb_kmeans.predict(remaining_data[['lat', 'long']])

    # Compute updated TSP
    centroids_with_start = np.vstack([starting_point, mb_kmeans.cluster_centers_])
    distance_matrix = squareform(pdist(centroids_with_start, metric='euclidean'))
    shortest_path, min_distance = tsp_with_start(distance_matrix)

    # Return the updated path
    return jsonify({
        #'received new point' : lat,
        'shortest_path': list(shortest_path),
        'min_distance': min_distance
    })

if __name__ == '__main__':
    # Initialize data and clusters
    coordinates = pd.read_csv('all1.csv')[['lat', 'long']]
    remaining_data = coordinates.sample(frac=0.9, random_state=42)  # Simulate initial data
    initialize_clusters()
    app.run(host='0.0.0.0', port=5000, debug=True)
