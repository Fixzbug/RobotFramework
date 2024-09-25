import requests
import zipfile
import os
import shutil
import subprocess
import re


def get_current_chromedriver_version(chromedriver_path):
    try:
        result = subprocess.run(
            [chromedriver_path, '--version'], capture_output=True, text=True)
        version = re.search(r'\d+\.\d+\.\d+\.\d+', result.stdout).group()
        return version
    except Exception as e:
        return None


def get_latest_stable_version():
    url = 'https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json'  # api last test
    response = requests.get(url)
    response.raise_for_status()

    version_info = response.json()
    latest_stable_version = version_info.get('channels', {}).get(
        'Stable', {}).get('version', 'Version not found')

    return latest_stable_version


def download_chromedriver(version, path_to_save):
    download_url = f"https://storage.googleapis.com/chrome-for-testing-public/{version}/win64/chromedriver-win64.zip"
    zip_path = os.path.join(path_to_save, 'chromedriver.zip')

    # Download the zip file
    with requests.get(download_url, stream=True) as r:
        with open(zip_path, 'wb') as f:
            shutil.copyfileobj(r.raw, f)

    # Unzip the file
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        zip_ref.extractall(path_to_save)

    # Remove the zip file
    os.remove(zip_path)

    # Move chromedriver.exe to the desired path
    extracted_dir = os.path.join(path_to_save, 'chromedriver-win64')
    chromedriver_path = os.path.join(extracted_dir, 'chromedriver.exe')
    final_destination = os.path.join(path_to_save, 'chromedriver.exe')

    # Remove old chromedriver if exists
    if os.path.exists(final_destination):
        os.remove(final_destination)

    # Move the new chromedriver to the final destination
    shutil.move(chromedriver_path, final_destination)

    # Remove the extracted directory
    if os.path.exists(extracted_dir):
        shutil.rmtree(extracted_dir)


def main(path_to_save):
    chromedriver_path = os.path.join(path_to_save, 'chromedriver.exe')
    current_version = get_current_chromedriver_version(chromedriver_path)
    print("current_version:", current_version)

    latest_version = get_latest_stable_version()
    print("latest_version:", latest_version)

    if current_version != latest_version:
        print(f"ChromeDriver updated to version {latest_version}")
        download_chromedriver(latest_version, path_to_save)
    else:
        print("ChromeDriver is already up to date.")


if __name__ == "__main__":
    # set path file program python
    path_to_save = r'C:\Users\Makerz\AppData\Local\Programs\Python\Python311'
    main(path_to_save)
