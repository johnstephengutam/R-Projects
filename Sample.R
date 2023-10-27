library(jsonlite)

# Read the JSON data into a data frame
json_text <- readLines(response.json")
json_data <- jsonlite::fromJSON(json_text)
flattened_data <- flatten(json_data)
#print(flattened_data)

# Convert dict to dataframe
df <- as.data.frame(json_data)

write.csv(df, file="flattened_data.csv")
print("Created CSV file")