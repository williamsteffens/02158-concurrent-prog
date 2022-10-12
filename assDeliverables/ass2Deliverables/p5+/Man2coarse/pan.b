	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Car */
;
		;
		
	case 4: /* STATE 4 */
		;
		now.down = trpt->bup.oval;
		;
		goto R999;

	case 5: /* STATE 8 */
		;
		now.up = trpt->bup.oval;
		;
		goto R999;

	case 6: /* STATE 14 */
		;
		now.inAlleyDown = trpt->bup.oval;
		;
		goto R999;
;
		
	case 7: /* STATE 18 */
		goto R999;

	case 8: /* STATE 16 */
		;
		now.inAlleyUp = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: /* STATE 22 */
		;
		now.inAlleyDown = trpt->bup.oval;
		;
		goto R999;
;
		
	case 11: /* STATE 26 */
		goto R999;

	case 12: /* STATE 24 */
		;
		now.inAlleyUp = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: /* STATE 29 */
		;
		now.down = trpt->bup.oval;
		;
		goto R999;

	case 15: /* STATE 31 */
		;
		now.up = trpt->bup.oval;
		;
		goto R999;

	case 16: /* STATE 44 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

