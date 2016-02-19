class openldap(
  $tls_reqcert = 'allow'
){
  if $tls_reqcert {
    validate_re($tls_reqcert, '^(?:allow|never|try|demand|hard)$')
    augeas { 'set TLS_REQCERT':
      context => '/files/etc/openldap/ldap.conf',
      lens    => 'Spacevars.lns',
      incl    => '/etc/openldap/ldap.conf',
      changes => [ "set TLS_REQCERT ${tls_reqcert}" ]
    }
  }
}
