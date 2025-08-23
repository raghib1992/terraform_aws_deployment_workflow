import sys
import json

def get_account_info(env):
    account_map = {
        "sandbox": {
            "account_id": "800643485173",
            "bucket_name": "sandbox-statefile-terraform",
            "account_name": "dev-account"
        },
        "dev": {
            "account_id": "800643485173",
            "bucket_name": "sandbox-statefile-terraform",
            "account_name": "dev-account"
        },
        "qa": {
            "account_id": "800643485173",
            "bucket_name": "sandbox-statefile-terraform",
            "account_name": "qa-account"
        },
        "performance": {
            "account_id": "677977426648",
            "bucket_name": "performance-statefile-terraform",
            "account_name": "performance-account"
        },
        "staging": {
            "account_id": "649128807268",
            "bucket_name": "staging-statefile-terraform",
            "account_name": "staging-account"
        },
        "staging-green": {
            "account_id": "606184927985",
            "bucket_name": "staging-green-statefile-terraform",
            "account_name": "staging-green-account"
        },
        "production": {
            "account_id": "271547279005",
            "account_name": "production-statefile-terraform"
        }
    }
    return account_map.get(env, {
        "account_id": "000000000000",
        "account_name": "unknown"
    })

def main():
    if len(sys.argv) != 3:
        print("Usage: build_matrix.py <json-list-of-subdomains> <env>")
        sys.exit(1)

    try:
        subdomains = json.loads(sys.argv[1])
    except json.JSONDecodeError:
        print("Invalid JSON input for subdomains.")
        sys.exit(1)

    env = sys.argv[2]
    account_info = get_account_info(env)

    # Build the two lists
    accounts = [{
        "account_id": account_info["account_id"],
        "env": env,
        "env_name": f"{env}-approval"
    }]
    subdomain_matrix = []
    for sub in subdomains:
        subdomain_matrix.append({
            "subdomain": sub,
            "path": f"{sub}"
        })

    # Output both as a JSON object
    print(json.dumps({
        "accounts": accounts,
        "subdomains": subdomain_matrix
    }))

if __name__ == "__main__":
    main()