package consoleTitle;

use strict;
use Plugins;
use Log qw(message);
use Globals qw(%config);

return unless 
Plugins::register('consoleTitle', 'Show info in title', \&on_unload);

my $hooks = Plugins::addHooks(
		['mainLoop::setTitle', \&on_setTitle]
	);

sub on_unload {
   Plugins::delHook($hooks);
}

sub on_setTitle {
	my (undef, $title) = @_;

	if ($config{'console_title'} == 1) {
		message "\x1b]0;$title->{return}\x07", "system";
	} else {
		message "\x1b]0;OpenKore\x07", "system";
	}
}