/// Satélites que alimentam a plataforma com dados orbitais.
enum FonteOrbital {
  amazonia1('Amazonia-1', 'INPE'),
  cbers4a('CBERS-4A', 'INPE / CAST'),
  sentinel1('Sentinel-1', 'ESA / Copernicus'),
  sentinel2('Sentinel-2', 'ESA / Copernicus'),
  goes16('GOES-16', 'NOAA'),
  aquaModis('Aqua / MODIS', 'NASA'),
  landsat9('Landsat 9', 'NASA / USGS');

  const FonteOrbital(this.nome, this.agencia);

  final String nome;
  final String agencia;
}
