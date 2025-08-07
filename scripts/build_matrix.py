import sys
import json

def get_account_info(env):
    # Map environment to AWS account details
    account_map = {
        "dev": {
            "account_id": "111111111111",
            "account_name": "dev-account"
        },
        "qa": {
            "account_id": "222222222222",
            "account_name": "qa-account"
        },
        "perf": {
            "account_id": "333333333333",
            "account_name": "perf-account"
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
