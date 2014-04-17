#!/usr/bin/perl -w
use strict;             #The "use strict;" isn't required but is strongly recommended
use DBI;                #DBI = Db independent interface; Ref: http://search.cpan.org/~timb/DBI/DBI.pm#General_Interface_Rules_&_Caveats
use Data::Dumper;       #Given a list of scalars or reference variables, Data::Dumper will write out their contents in perl syntax

############################################################################################################################################
#	Taking user inputs
#print "\nEnter the name of the table to be created:\n";
#chomp(my $table = <STDIN>);

#print "\nEnter the name of the source file with absolute path:\n";
#chomp(my $file = <STDIN>);

#print "\nIs there a header line in the source file? [y/n]\n";
#chomp(my $answer = <STDIN>);

#print "\nEnter primary key: [col_name/no (if no key is there)]\n";
#chomp(my $pkey = <STDIN>);

#################################################################################################################################################################################	Fetching column names for the table from the source file

################################################################################################################################################################################
#	#Connecing to a mysql database called plant_genomics
my $dbh = DBI->connect('dbi:mysql:plant_genomics','my_acc','mynewpass') or die "\nConnection failed!\n\n";
        #This step is for "connecting" to a data source and getting a handle for that connection
        #Syntax: my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 0 });
                #DSN = DBI Data Source Name
                #$dbh = db handle object
		#Explicitly defining the required AutoCommit behaviour is strongly recommended. This determines whether changes are automatically committed to the database when executed, or need to be explicitly committed later.

################################################################################################################################################################################
#	Creating a mysql table (with architecture identical to that of the file to be uploaded): 

        #The DBI allows an application to "prepare" statements for later "execution". A prepared statement is identified by a statement handle ($sth) held in a Perl variable.
        #In DBI, queries and other statements must be expressed as a single string of characters passed as the first argument to the "prepare" or "do" methods.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	table = Ah_genome_synteny
#my $sth = $dbh->prepare("CREATE TABLE $table (At_Protein_id varchar(15), Ah_scaffold varchar(20), scaffold_length int(10), percent_identity float(10,2), Alignment_length int(5), At_start_aa int(10), At_end_aa int(10), Ah_start_nuc int(10), Ah_end_nuc int(10), evalue varchar(10), At_chr_no varchar(5), At_start_nuc int(10), At_end_nuc int(10), At_direction_nuc char(10), At_protein_size int(10), At_protein_name varchar(1000))") or die "\nCannot prepare the request!\n\n";

#	table = gi_entries_in_nr_nt
#my $sth = $dbh->prepare("CREATE TABLE $table(gene_id INT(20) NOT NULL,gene_name VARCHAR(500) NOT NULL, PRIMARY KEY (gene_id))") or die "\nCannot prepare the request!\n\n";

#	table = AhT5s_vs_nr_nt_csv_parsed_sorted
#my $sth = $dbh->prepare("CREATE TABLE $table (scaffold VARCHAR(30) NOT NULL, gene_id INT(20) NOT NULL, percent_identity FLOAT(5,3) NOT NULL, align_length INT(10) NOT NULL)") or die "\nCannot prepare the request!\n\n";
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
=begin
#27-10-2012
#	table = At_karyotype
my $sth = $dbh->prepare("CREATE TABLE $ARGV[0] (band CHAR(5), chr_no VARCHAR(5), At_id_1 VARCHAR(10), At_id_2 VARCHAR(10), At_start INT(20), At_end INT(20), stain VARCHAR(10))") or die "\nCannot prepare the request!\n\n";
$sth -> execute();
print "\nTable $ARGV[0] created in the mysql database plant_genomics!\n";

#	table = synteny_At_sorted
my $sth = $dbh->prepare("CREATE TABLE $ARGV[1] (At_id VARCHAR(10), Isoform INT(1), Ah_scaffold VARCHAR(30), S_length INT(10), Percent_id FLOAT(6,2), Align_length INT(10), At_aa_start INT(10), At_aa_end INT(10), S_nuc_start INT(20), S_nuc_end INT(20), Evalue VARCHAR(10), At_chr VARCHAR(5), At_nuc_start INT(20), At_nuc_end INT(20), At_dir CHAR(7), At_aa_length INT(10), At_protein VARCHAR(1000))") or die "\nCannot prepare the request!\n\n";
$sth -> execute();
print "\nTable $ARGV[1] created in the mysql database plant_genomics!\n";

#	table = synteny_At_parsed (FROM FILE: Synteny_At_parsed.sorted)
my $sth = $dbh->prepare("CREATE TABLE $ARGV[2] (At_id VARCHAR(10), Isoform INT(1), Ah_scaffold VARCHAR(30), S_length INT(10), S_nuc_start INT(20), S_nuc_end INT(20), S_nuc_diff INT(20), S_dir CHAR(1), Percent_id FLOAT(6,2), Align_length INT(10), At_chr VARCHAR(5), At_nuc_start INT(20), At_nuc_end INT(20), At_nuc_diff INT(20), At_dir CHAR(7), At_protein VARCHAR(1000))") or die "\nCannot prepare the request!\n\n";
$sth -> execute();
print "\nTable $ARGV[2] created in the mysql database plant_genomics!\n";

#	table = tblastn_At_vs_AhG2s
my $sth = $dbh->prepare("CREATE TABLE $ARGV[3] (At_id VARCHAR(10), Isoform INT(1), Ah_scaffold VARCHAR(30), S_length INT(10), Percent_id FLOAT(6,2), Align_length INT(10), mismatches INT(6), gap_opens INT(3), At_aa_start INT(10), At_aa_end INT(10), S_nuc_start INT(20), S_nuc_end INT(20), Evalue VARCHAR(10), bit_score FLOAT(6,2))") or die "\nCannot prepare the request!\n\n";
$sth -> execute();
print "\nTable $ARGV[3] created in the mysql database plant_genomics!\n";

#	table = parsed_TAIRpep
my $sth = $dbh->prepare("CREATE TABLE $ARGV[4] (At_id VARCHAR(10), Isoform INT(1), At_chr VARCHAR(5), At_nuc_start INT(20), At_nuc_end INT(20), At_dir CHAR(7), At_aa_length INT(10), At_protein VARCHAR(1000))") or die "\nCannot prepare the request!\n\n";
$sth -> execute();
print "\nTable $ARGV[4] created in the mysql database plant_genomics!\n";
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

=cut
#	table = 
my $sth = $dbh->prepare("CREATE TABLE $ARGV[0] ()") or die "\nCannot prepare the request!\n\n";
$sth->execute();
print "\nTable $ARGV[0] created in the mysql database plant_genomics!\n";

################################################################################################################################################################################
