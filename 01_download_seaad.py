import requests
import os

# Synapse ID syn26529181 (old/not working), this is the new one (syn26223298)
url = "https://github.com/SEA-AD/seaad-data-releases/raw/main/metadata.csv"
os.makedirs("data/seaad", exist_ok=True)
r = requests.get(url, allow_redirects=True)
open("data/seaad/metadata.csv", "wb").write(r.content)

# this data includes 85 AD/control samples with neuronal/glial transcriptomes.
