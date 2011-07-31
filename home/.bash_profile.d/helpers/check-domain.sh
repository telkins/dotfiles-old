########################################################################################
# function for checking a domain name's availability (not registered)
########################################################################################

function check-domain {
    whois $1 | grep -q 'No match' && echo "Domain Is Not Available" || echo "Domain Is Available"
}

