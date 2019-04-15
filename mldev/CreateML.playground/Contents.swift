import CreateML
import Foundation

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/akshitarora/Documents/GitHub/courses/ml_hci/FinalProject-PersonalizedHealth/mldev/simulated.json"))

let regressor = try MLDecisionTreeClassifier(trainingData: data, targetColumn: "stage", featureColumns: ["jog_abs_time", "jog_frac_time", "jog_abs_dist", "jog_frac_dist"])

let metadata = MLModelMetadata(author: "Akshit Arora", shortDescription: "A model trained to predict stage in a couch to 5k plan.", version: "1.0")

try regressor.write(to: URL(fileURLWithPath: "/Users/akshitarora/Documents/GitHub/courses/ml_hci/FinalProject-PersonalizedHealth/mldev/StageCalculator.mlmodel"), metadata: metadata)
