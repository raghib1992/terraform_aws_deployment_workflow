import sys
import json

def get_account_info(env):
    # Map environment to AWS account details
    account_map = {
        "sandbox": {
            "account_id": "271547279005",
            "account_name": "dev-account"
        },
        "dev": {
            "account_id": "XXXXXXXXXXXX",
            "account_name": "dev-account"
        },
        "qa": {
            "account_id": "222222222222",
            "account_name": "qa-account"
        },
        "performance": {
            "account_id": "333333333333",
            "account_name": "performance-account"
        },
        "staging": {
            "account_id": "XXXXXXXXXXXX",
            "account_name": "staging-account"
        },
        "staging-green": {
            "account_id": "XXXXXXXXXXXX",
            "account_name": "staging-green-account"
        },
        "production": {
            "account_id": "XXXXXXXXXXXX",
            "account_name": "production-account"
        }
    }
    # Fallback if env not found
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

    matrix = []
    for sub in subdomains:
        matrix.append({
            "subdomain": sub,
            "env": env,
            "account_id": account_info["account_id"],
            "account_name": account_info["account_name"],
            "path": f"./{sub}"
        })

    print(json.dumps(matrix))  # Output to stdout

if __name__ == "__main__":
    main()
