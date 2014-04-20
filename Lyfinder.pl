 #!/usr/bin/perl

use strict;
use warnings;
use Web::Scraper;
use URI;
use utf8;
use Encode;
use YAML;

### Now Version 0.2
#一応 『歌詞の保存、印刷、引用、
#コピー&ペーストは著作権保護の観点から禁止しています。』
#ってのがけっこうある。
#注意 http://0yen-blog.com/sub_blog/ameba/3934/
#あまりばらまかないでね♡

my $uri = new URI(@ARGV);
if ($ARGV[0] eq 0) {
		print "Lyfinder [http://mojim.com/twy...x...x...htm]\n"
	} elsif ($ARGV[0]=~ m(mojim\.com/twy)) {
my $scraper = scraper {
		process '#fsZ dl', 'Lyrics[]' => 'TEXT';
	};	
my $text = $scraper->scrape($uri);
	for (@{$text->{Lyrics}}) {
	$_ =~ s/(更多更詳盡歌詞 在| ※ Mojim.com　魔鏡歌詞網)//g;
		print "\n", Encode::encode('utf8', YAML::Dump($_));
		    } 
		print "-------------Dump complete-------------\n";
	 } else {
		    print "Not mojim.com lyrics..."."\n";
		    print "Lyfinder [http://mojim.com/twy...x...x...htm]\n"
    	}
    exit;