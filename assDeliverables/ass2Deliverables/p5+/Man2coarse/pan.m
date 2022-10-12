#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC Car */
	case 3: /* STATE 2 - Man2coarse.pml:25 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 3 - Man2coarse.pml:26 - [((up==0))] (19:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.up==0)))
			continue;
		/* merge: down = (down+1)(0, 4, 19) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (now.down+1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		/* merge: .(goto)(0, 11, 19) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: /* STATE 7 - Man2coarse.pml:28 - [((down==0))] (19:0:1 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!((now.down==0)))
			continue;
		/* merge: up = (up+1)(0, 8, 19) */
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (now.up+1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		/* merge: .(goto)(0, 11, 19) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 6: /* STATE 13 - Man2coarse.pml:54 - [((pid<4))] (20:0:1 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown+1)(20, 14, 20) */
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)+1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(20, 18, 20) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 7: /* STATE 18 - Man2coarse.pml:57 - [.(goto)] (0:20:0 - 2) */
		IfNotBlocked
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 16 - Man2coarse.pml:55 - [inAlleyUp = (inAlleyUp+1)] (0:20:1 - 1) */
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)+1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(20, 18, 20) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 9: /* STATE 20 - Man2coarse.pml:58 - [assert(!((inAlleyUp&&inAlleyDown)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		spin_assert( !((((int)now.inAlleyUp)&&((int)now.inAlleyDown))), " !((inAlleyUp&&inAlleyDown))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 21 - Man2coarse.pml:61 - [((pid<4))] (34:0:1 - 1) */
		IfNotBlocked
		reached[0][21] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown-1)(34, 22, 34) */
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)-1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(34, 26, 34) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 11: /* STATE 26 - Man2coarse.pml:64 - [.(goto)] (0:34:0 - 2) */
		IfNotBlocked
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 24 - Man2coarse.pml:62 - [inAlleyUp = (inAlleyUp-1)] (0:34:1 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)-1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(34, 26, 34) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: /* STATE 28 - Man2coarse.pml:34 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 29 - Man2coarse.pml:35 - [down = (down-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][29] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (now.down-1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 31 - Man2coarse.pml:37 - [up = (up-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (now.up-1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 44 - Man2coarse.pml:72 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

