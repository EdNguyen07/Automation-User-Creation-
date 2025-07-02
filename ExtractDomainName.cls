String sandboxName = '';
String host = URL.getOrgDomainUrl().getHost();
if (host.contains('--')) {
    String[] parts = host.split('--');
    System.debug('parts: ' + parts);
    if (parts.size() > 1) {
        String[] subParts = parts[1].split('\\.');
        System.debug('subParts: ' + subParts);
        if (subParts.size() > 0) {
            sandboxName = subParts[0];
        }
    }
}
System.debug('Sandbox Name: ' + sandboxName);
String uniqueUsername = 'susu1' + '@navynpc.my.salesforce.com.'+ sandboxName;
System.debug('Dynamic Username: ' + uniqueUsername);
