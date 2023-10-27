# importing packages
library(jsonlite)
library(tidyverse)

# Opening JSON file
json_file_path <- "C:\\response.json"
json_data <- read_json(json_file_path)

# Flatten JSON data
flattened_data <- jsonlite::flatten(json_data)

# Convert flattened JSON data to a data frame
data_frame <- as.data.frame(flattened_data)

# Specify column names
column_names <- c("Notices", "Infringing_urls")

# Write data frame to a CSV file
write.csv(data_frame, "CSVFile.csv", row.names = FALSE, col.names = column_names) 
 

# Print a message indicating the CSV file has been created
cat("CSV file 'CSVFile.csv' has been created.\n")


# Getting the Domain name and IPAddress and storing in another CSV file
count = 0
write.csv(data_frame, "CSV_Domain_IPAddress.csv", row.names = FALSE, col.names = column_names)
  column_names <- c("Domain","IPAddress")
  
    for key in flat_json.items():
      try:
        strVal = str(key)
        if "infringing_urls" not in strVal:
          continue
        domain = value.split('/')
        ipAddress = socket.gethostbyname(str(domain[2]))
    
        f.write("%s,%s\n" % (domain[2], ipAddress))
    
        if count == 10000:
           break
        count = count + 1
        except Exception:
        pass

# Getting the CSV data in the dataframe format to do the operations on the data
df = pd.read_csv("CSV_Domain_IPAddress.csv")
# print(df)


# Summarization1: Group data by domain and ipaddress the count
url_distribution = df.groupby('Domain').size().reset_index(name='IPAddress')
print(url_distribution)

# Plotting the age distribution
plt.bar(url_distribution['Domain'], url_distribution['IPAddress'])
plt.xlabel('Domain')
plt.ylabel('IPAddress')
plt.title('URL Distribution')
plt.show()

# Summarization 2: Domain Distribution in sample of 100 records
gender_distribution = df['Domain'].value_counts(normalize=True) * 100
print("\nURL Distribution:")
print(gender_distribution)

# Summarization 3: Calculate the frequency of each name
name_counts = df['Domain'].value_counts()
# Get the top 5 most common names
top_5_names = name_counts.head(5)
print(top_5_names)