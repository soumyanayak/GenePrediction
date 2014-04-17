#!/usr/bin/perl -w
use strict;             #The "use strict;" isn't required but is strongly recommended
use DBI;                #DBI = Db independent interface; Ref: http://search.cpan.org/~timb/DBI/DBI.pm#General_Interface_Rules_&_Caveats
use Data::Dumper;       #Given a list of scalars or reference variables, Data::Dumper will write out their contents in perl syntax

############################################################################################################################################
#########Taking user inputs:
print "\nEnter the name of the mysql table from which the data is to be fetched:\n";
chomp(my $table = <>);

############################################################################################################################################
#########Connecting to the mysql database called plant_genomics
my $dbh = DBI->connect('dbi:mysql:plant_genomics','my_acc','mynewpass') or die "\nConnection failed!\n\n";
        #This step is for "connecting" to a data source and getting a handle for that connection
        #Syntax: my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 0 });
                #DSN = DBI Data Source Name
                #$dbh = db handle object
                #Explicitly defining the required AutoCommit behaviour is strongly recommended. This determines whether changes are automatically committed to the database when executed, or need to be explicitly committed later.

############################################################################################################################################
#########Fetching data from the mysql table

#Fetching rows from the table "gi_entries_in_nr_nt" for gene ids present in /home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi_uniq.txt" 
open r1,"/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi_uniq.txt" or die $!;
open w1,">/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi_uniq_annotated.txt" or die $!;

chomp(my @gi = <r1>);
for(my $i=0;$i<@gi;$i++)
{
	my $fetch = $dbh->prepare("SELECT * FROM $table WHERE gene_id = $gi[$i]") or die "\nCannot prepare the request!\n\n";
	$fetch -> execute();
        #The DBI allows an application to "prepare" statements for later "execution". A prepared statement is identified by a statement handle ($sth) held in a Perl variable.
        #In DBI, queries and other statements must be expressed as a single string of characters passed as the first argument to the "prepare" or "do" methods.
	my $row = $fetch->fetchrow_array();	#just gave the gene_names in w1
	print w1 "$row\n";
}

############################################################################################################################################
