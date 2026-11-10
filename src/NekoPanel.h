/* NekoPanel */

#import <Cocoa/Cocoa.h>
#import "NekoView.h"

@interface NekoPanel : NSPanel
{
	NekoView *view;
	
	NSArray *stop, *jare, *mati, *kaki, *akubi, *sleep, *awake, *u_move, *d_move,
	        *l_move, *r_move, *ul_move, *ur_move, *dl_move, *dr_move, *u_togi,
			*d_togi, *l_togi, *r_togi;
	
	id nekoState;
	unsigned char tickCount, stateCount, idleRounds, awayTicks;
	float moveDx, moveDy;
	id myTimer;
	
}
@end
