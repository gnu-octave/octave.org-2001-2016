function Contributor (name, address, role, lat, lon) {
  this.name = name;
  this.address = address;
  this.role = role;
  this.lat = lat;
  this.lon = lon;
}

function getContributorsList() {
  return [
    new Contributor("John W. Eaton", "Sharon, PA", "original author, developer", 41.2329700,-80.4992250),
    new Contributor("David Bateman", "Boulogne-Billancourt, FR", "developer", 48.8338029,2.2433300),
    new Contributor("Jaroslav Hájek", "Prague, CZ", "developer, release manager", 50.0878114,14.4204598),
    new Contributor("John Swensen", "Baltimore, MD", "developer (OctaveDE)", 39.2942550,-76.6142750),
    new Contributor("Bill Denney", "Lansdale, PA", "developer", 40.2415630,-75.2837470),
    new Contributor("Søren Hauberg", "Copenhagen, DK", "developer (slacker)", 55.6762944,12.5681157),
    new Contributor("Michael D. Godfrey", "Stanford, CA", "plotting (and a few other things) developer", 37.4402210,-122.1632990),
    new Contributor("Rafael Laboissière", "Sassenage, FR", "developer, Debian packager", 45.2080732,5.6580511),
    new Contributor("Michaël Goffioul", "Cork, IR", "developer", 51.8978655,-8.4710941),
    new Contributor("Shai Ayal", "Shoham, IL", "developer", 31.996667, 34.942778),
    new Contributor("Ben Abbott", "Longwood, FL", "developer", 28.6977650,-81.3461990),
    new Contributor("Jason Riedy", "Lebanon, VA USA", "developer", 36.9012920,-82.0768350),
    new Contributor("Francesco Potortì", "Pisa, IT", "developer", 43.7161354,10.3965843),
    new Contributor("Thorsten Meyer", "Munich, DE", "developer", 48.1391265,11.5801863)  ];
}
