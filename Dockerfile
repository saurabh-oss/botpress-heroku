# Pull the docker image for Botpress using desired version
FROM botpress/server:v12_20_2
# Add existing data from local (optional step)
ADD . /botpress
# Set the working directory
WORKDIR /botpress
# Start Botpress server
CMD ["./bp"]
