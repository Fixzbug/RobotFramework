import requests


def get_latest_stable_version():
    url = 'https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json'
    response = requests.get(url)
    response.raise_for_status()

    version_info = response.json()
    latest_stable_version = version_info.get('channels', {}).get(
        'Stable', {}).get('version', 'Version not found')

    return latest_stable_version


latest_version = get_latest_stable_version()
print(f"Latest stable version: {latest_version}")
