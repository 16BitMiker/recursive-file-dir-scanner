#!/usr/bin/env perl

# #################################### PRAGMAS

use Cwd;
use utf8;
use strict;
use warnings;
use feature qw|say|;
use File::MimeInfo;

# #################################### GLOBALS

my @ff         = glob(getcwd.q|/*|);
my $data       = {};
my $char_limit = 50;

# #################################### INIT

LOOP:
{
    my $item = shift @ff;

    if (-d $item)
    {
        my $dir = $item;
        $$data{$dir} = [];
        push @ff, glob($dir.q|/*|)
    }
    elsif (-f $item)
    {
        my ($file, $path);

        if ($item =~ m`^(.*)/(.*)\Z`)
        {
            $path = $1; $file = $2;
        }

        push @{$$data{$path}}, sprintf "%-${char_limit}.${char_limit}s  %-22s  %s", $file, mimetype($file) // q|unknown|, &fileSize($item);
    }

    redo LOOP if @ff;
}

for my $folder (sort keys %{$data})
{
    say qq|$folder|;
    say '-'x30;
    map { say } @{$$data{$folder}};
    say "\n";
}

# #################################### SUB

sub fileSize($)
{
    my $size = @{[ stat shift ]}[7];

    my $b  = 0;
    my $kb = 1_000;
    my $mb = 1_000_000;
    my $gb = 1_000_000_000;
    my $tb = 1_000_000_000_000;

    if ($size >= $b and $size < $kb)
    {
        return (sprintf qq|%.2f|, $size) . q| Bytes|;
    }
    elsif ($size >= $kb and $size < $mb)
    {
        return (sprintf qq|%.2f|, $size / $kb) . q| Kilobytes|;
    }
    elsif ($size >= $mb and $size < $gb)
    {
        return (sprintf qq|%.2f|, $size / $mb) . q| Megabytes|;
    }
    elsif ($size >= $gb and $size < $tb)
    {
        return (sprintf qq|%.2f|, $size / $gb) . q| Gigabytes|;
    }
    elsif ($size >= $tb)
    {
        return (sprintf qq|%.2f|, $size / $tb) . q| Terabytes|;
    }
}

__END__
# File extension modifcation

        my $file_display = $file;

        if ($file_display =~ m`^.*\..*`)
        {
            my $extension   = $file =~ s`^.*(\..*)`$1`ger;
            my $length_ext  = length $extension;
            my $length_file = length ($file =~ s`^(.*)\..*`$1`r);

            if (($length_file - $length_ext - 1) >= $char_limit)
            {
                my $l = $char_limit - $length_ext - 1;
                $file_display =~ s`^(.{$l}).*`qq|${1}~${extension}|`ge;
            }
        }
