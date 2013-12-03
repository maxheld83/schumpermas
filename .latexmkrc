add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
add_cus_dep('acn', 'acr', 0, 'makeglo2gls');
sub makeglo2gls {
  my ($base_name, $path) = fileparse( $_[0] );
  pushd($path);
  system("makeglossaries $base_name");
  popd;
}