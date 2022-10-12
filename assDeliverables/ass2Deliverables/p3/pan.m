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
	case 3: /* STATE 2 - Man2multi.pml:24 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 3 - Man2multi.pml:25 - [((downSem>0))] (12:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)now.downSem)>0)))
			continue;
		/* merge: downSem = (downSem-1)(0, 4, 12) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)-1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 5: /* STATE 6 - Man2multi.pml:27 - [((down==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][6] = 1;
		if (!((now.down==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 7 - Man2multi.pml:27 - [((upSem>0))] (14:0:1 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)now.upSem)>0)))
			continue;
		/* merge: upSem = (upSem-1)(0, 8, 14) */
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)-1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		/* merge: .(goto)(0, 13, 14) */
		reached[0][13] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 7: /* STATE 14 - Man2multi.pml:30 - [t = down] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.down;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 15 - Man2multi.pml:30 - [down = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 16 - Man2multi.pml:31 - [downSem = (downSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)+1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 19 - Man2multi.pml:34 - [((upSem>0))] (28:0:1 - 1) */
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)now.upSem)>0)))
			continue;
		/* merge: upSem = (upSem-1)(0, 20, 28) */
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)-1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 11: /* STATE 22 - Man2multi.pml:36 - [((up==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		if (!((now.up==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 23 - Man2multi.pml:36 - [((downSem>0))] (30:0:1 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		if (!((((int)now.downSem)>0)))
			continue;
		/* merge: downSem = (downSem-1)(0, 24, 30) */
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)-1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		/* merge: .(goto)(0, 29, 30) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 13: /* STATE 30 - Man2multi.pml:39 - [t = up] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][30] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.up;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 31 - Man2multi.pml:39 - [up = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 32 - Man2multi.pml:40 - [upSem = (upSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)+1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 37 - Man2multi.pml:75 - [((pid<4))] (44:0:1 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown+1)(44, 38, 44) */
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)+1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(44, 42, 44) */
		reached[0][42] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: /* STATE 42 - Man2multi.pml:78 - [.(goto)] (0:44:0 - 2) */
		IfNotBlocked
		reached[0][42] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 40 - Man2multi.pml:76 - [inAlleyUp = (inAlleyUp+1)] (0:44:1 - 1) */
		IfNotBlocked
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)+1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(44, 42, 44) */
		reached[0][42] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 19: /* STATE 44 - Man2multi.pml:79 - [assert(!((inAlleyUp&&inAlleyDown)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		spin_assert( !((((int)now.inAlleyUp)&&((int)now.inAlleyDown))), " !((inAlleyUp&&inAlleyDown))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 45 - Man2multi.pml:82 - [((pid<4))] (74:0:1 - 1) */
		IfNotBlocked
		reached[0][45] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown-1)(74, 46, 74) */
		reached[0][46] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)-1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(74, 50, 74) */
		reached[0][50] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 21: /* STATE 50 - Man2multi.pml:85 - [.(goto)] (0:74:0 - 2) */
		IfNotBlocked
		reached[0][50] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 48 - Man2multi.pml:83 - [inAlleyUp = (inAlleyUp-1)] (0:74:1 - 1) */
		IfNotBlocked
		reached[0][48] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)-1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(74, 50, 74) */
		reached[0][50] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 23: /* STATE 52 - Man2multi.pml:46 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][52] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 53 - Man2multi.pml:47 - [t = down] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][53] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.down;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 54 - Man2multi.pml:47 - [down = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 55 - Man2multi.pml:49 - [((down==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][55] = 1;
		if (!((now.down==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 56 - Man2multi.pml:49 - [upSem = (upSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][56] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)+1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 63 - Man2multi.pml:54 - [t = up] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][63] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.up;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 64 - Man2multi.pml:54 - [up = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 65 - Man2multi.pml:56 - [((up==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][65] = 1;
		if (!((now.up==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 66 - Man2multi.pml:56 - [downSem = (downSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][66] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)+1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 84 - Man2multi.pml:93 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
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

