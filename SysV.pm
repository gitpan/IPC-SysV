# IPC::SysV.pm
#
# Copyright (c) 1997 Graham Barr <gbarr@pobox.com>. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package IPC::SysV;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION);
use Carp;
use Config;

require Exporter;
@ISA = qw(Exporter);

$VERSION = "1.00";

@EXPORT_OK = qw(
	IPC_STAT IPC_SET IPC_RMID IPC_NOWAIT IPC_PRIVATE
	IPC_CREAT IPC_ALLOC IPC_EXCL

	SEM_A SEM_R SEM_UNDO
	GETVAL GETPID GETNCNT GETZCNT GETALL SETVAL SETALL

	MSG_R MSG_W MSG_NOERROR MSG_RWAIT MSG_WWAIT

	SHM_A SHM_R SHM_RDONLY SHM_RND SHM_LOCK SHM_UNLOCK
	SHMLBA SHM_SHARE_MMU

	S_IRUSR S_IWUSR S_IRWXU
	S_IRGRP S_IWGRP S_IRWXG
	S_IROTH S_IWOTH S_IRWXO
);

BOOT_XS: {
    # If I inherit DynaLoader then I inherit AutoLoader and I DON'T WANT TO
    require DynaLoader;

    # DynaLoader calls dl_load_flags as a static method.
    *dl_load_flags = DynaLoader->can('dl_load_flags');

    do {
	__PACKAGE__->can('bootstrap') || \&DynaLoader::bootstrap
    }->(__PACKAGE__, $VERSION);
}

1;

__END__

=head1 NAME

IPC::SysV - SysV IPC constants

=head1 SYNOPSIS

    use IPC::SysV qw(IPC_STAT IPC_PRIVATE);

=head1 DESCRIPTION

C<IPC::SysV> defines and conditionally exports all the constants
defined in your system include files which are needed by the SysV
IPC calls.

=head1 SEE ALSO

L<IPC::Msg> L<IPC::Semaphore>

=head1 AUTHOR

Graham Barr <gbarr@pobox.com>

=head1 COPYRIGHT

Copyright (c) 1997 Graham Barr. All rights reserved.
This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

