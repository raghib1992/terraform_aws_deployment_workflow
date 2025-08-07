import sys
import json

def main():
    if len(sys.argv) != 3:
        print("Usage: build_matrix.py <json-list-of-subdomains> <env>")
        sys.exit(1)

    subdomains = json.loads(sys.argv[1])
    env = sys.argv[2]

    matrix = [{"subdomain": s, "env": env} for s in subdomains]
    print(json.dumps(matrix))  # Output to stdout for GitHub to capture

if __name__ == "__main__":
    main()