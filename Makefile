# https://instagram.com/developer/authentication/
generateOauth:
	open "https://api.instagram.com/oauth/authorize/?client_id=$$IG_CLIENT_ID&redirect_uri=http://artsmia.org/__instagram&response_type=code"
	read -p "Enter the code instagram gives you … " code; \
	echo $$code; \
	echo; \
	curl -F \
		"client_id=$$IG_CLIENT_ID" \
		-F "client_secret=$$IG_CLIENT_SECRET" \
		-F 'grant_type=authorization_code' \
		-F 'redirect_uri=http://artsmia.org/__instagram' \
		-F "code=$$code" https://api.instagram.com/oauth/access_token \
	| jq '.'

getMIAInstagramPlaceIds:
	curl "https://api.instagram.com/v1/locations/search?lat=44.95861&lng=-93.27447&access_token=$$IG_TOKEN" \
	| jq '.'
