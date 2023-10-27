

"""

json_data <- read_json(json_file_path)

print(json_data)

#flattened_json_data <- flatten(json_data)

df <- as.data.frame(json_data)

for (key, value in jsonlite::fromJSON(json_data)) {
  print(key)
  print(value)
}
"""

library(jsonlite)

json_data <- '{
  "key1": "value1",
  "key2": "value2",
  "key3": "value3"
}'

for (key in jsonlite::fromJSON(txt = json_data)) {
  print(key)
  print(value)
}
