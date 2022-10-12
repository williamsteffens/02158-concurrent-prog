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
	case 3: /* STATE 2 - Man2baton.pml:30 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 3 - Man2baton.pml:32 - [((eSem>0))] (16:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)now.eSem)>0)))
			continue;
		/* merge: eSem = (eSem-1)(0, 4, 16) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)-1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 5: /* STATE 6 - Man2baton.pml:34 - [((up>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][6] = 1;
		if (!((now.up>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 7 - Man2baton.pml:35 - [t = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.ddown;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 8 - Man2baton.pml:35 - [ddown = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 9 - Man2baton.pml:36 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 11 - Man2baton.pml:37 - [((downSem>0))] (18:0:1 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((int)now.downSem)>0)))
			continue;
		/* merge: downSem = (downSem-1)(0, 12, 18) */
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)-1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		/* merge: .(goto)(0, 17, 18) */
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: /* STATE 18 - Man2baton.pml:41 - [t = down] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.down;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 19 - Man2baton.pml:41 - [down = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 20 - Man2baton.pml:44 - [((ddown>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		if (!((now.ddown>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 21 - Man2baton.pml:45 - [t = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.ddown;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 22 - Man2baton.pml:45 - [ddown = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 23 - Man2baton.pml:46 - [downSem = (downSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)+1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 26 - Man2baton.pml:48 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 31 - Man2baton.pml:53 - [((eSem>0))] (44:0:1 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)now.eSem)>0)))
			continue;
		/* merge: eSem = (eSem-1)(0, 32, 44) */
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)-1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: /* STATE 34 - Man2baton.pml:55 - [((down>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][34] = 1;
		if (!((now.down>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 35 - Man2baton.pml:56 - [t = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.dup;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 36 - Man2baton.pml:56 - [dup = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 37 - Man2baton.pml:57 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 39 - Man2baton.pml:58 - [((upSem>0))] (46:0:1 - 1) */
		IfNotBlocked
		reached[0][39] = 1;
		if (!((((int)now.upSem)>0)))
			continue;
		/* merge: upSem = (upSem-1)(0, 40, 46) */
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)-1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		/* merge: .(goto)(0, 45, 46) */
		reached[0][45] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: /* STATE 46 - Man2baton.pml:62 - [t = up] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.up;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 47 - Man2baton.pml:62 - [up = (t+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][47] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (((P0 *)this)->_1_t+1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 48 - Man2baton.pml:65 - [((dup>0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][48] = 1;
		if (!((now.dup>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 49 - Man2baton.pml:66 - [t = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][49] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.dup;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 50 - Man2baton.pml:66 - [dup = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 51 - Man2baton.pml:67 - [upSem = (upSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][51] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)+1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 54 - Man2baton.pml:69 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 61 - Man2baton.pml:119 - [((pid<4))] (68:0:1 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown+1)(68, 62, 68) */
		reached[0][62] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)+1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(68, 66, 68) */
		reached[0][66] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 31: /* STATE 66 - Man2baton.pml:122 - [.(goto)] (0:68:0 - 2) */
		IfNotBlocked
		reached[0][66] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 64 - Man2baton.pml:120 - [inAlleyUp = (inAlleyUp+1)] (0:68:1 - 1) */
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)+1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(68, 66, 68) */
		reached[0][66] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: /* STATE 68 - Man2baton.pml:123 - [assert(!((inAlleyUp&&inAlleyDown)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		spin_assert( !((((int)now.inAlleyUp)&&((int)now.inAlleyDown))), " !((inAlleyUp&&inAlleyDown))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 34: /* STATE 69 - Man2baton.pml:126 - [((pid<4))] (110:0:1 - 1) */
		IfNotBlocked
		reached[0][69] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		/* merge: inAlleyDown = (inAlleyDown-1)(110, 70, 110) */
		reached[0][70] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyDown);
		now.inAlleyDown = (((int)now.inAlleyDown)-1);
#ifdef VAR_RANGES
		logval("inAlleyDown", ((int)now.inAlleyDown));
#endif
		;
		/* merge: .(goto)(110, 74, 110) */
		reached[0][74] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: /* STATE 74 - Man2baton.pml:129 - [.(goto)] (0:110:0 - 2) */
		IfNotBlocked
		reached[0][74] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 72 - Man2baton.pml:127 - [inAlleyUp = (inAlleyUp-1)] (0:110:1 - 1) */
		IfNotBlocked
		reached[0][72] = 1;
		(trpt+1)->bup.oval = ((int)now.inAlleyUp);
		now.inAlleyUp = (((int)now.inAlleyUp)-1);
#ifdef VAR_RANGES
		logval("inAlleyUp", ((int)now.inAlleyUp));
#endif
		;
		/* merge: .(goto)(110, 74, 110) */
		reached[0][74] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 37: /* STATE 76 - Man2baton.pml:77 - [((pid<4))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][76] = 1;
		if (!((((int)((P0 *)this)->_pid)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 77 - Man2baton.pml:79 - [((eSem>0))] (80:0:1 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!((((int)now.eSem)>0)))
			continue;
		/* merge: eSem = (eSem-1)(0, 78, 80) */
		reached[0][78] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)-1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 39: /* STATE 80 - Man2baton.pml:80 - [t = down] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][80] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.down;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: /* STATE 81 - Man2baton.pml:80 - [down = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][81] = 1;
		(trpt+1)->bup.oval = now.down;
		now.down = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("down", now.down);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: /* STATE 82 - Man2baton.pml:83 - [(((down==0)&&(dup>0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][82] = 1;
		if (!(((now.down==0)&&(now.dup>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: /* STATE 83 - Man2baton.pml:84 - [t = dup] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][83] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.dup;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: /* STATE 84 - Man2baton.pml:84 - [dup = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
		(trpt+1)->bup.oval = now.dup;
		now.dup = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("dup", now.dup);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: /* STATE 85 - Man2baton.pml:85 - [upSem = (upSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][85] = 1;
		(trpt+1)->bup.oval = ((int)now.upSem);
		now.upSem = (((int)now.upSem)+1);
#ifdef VAR_RANGES
		logval("upSem", ((int)now.upSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: /* STATE 88 - Man2baton.pml:87 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][88] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: /* STATE 93 - Man2baton.pml:92 - [((eSem>0))] (96:0:1 - 1) */
		IfNotBlocked
		reached[0][93] = 1;
		if (!((((int)now.eSem)>0)))
			continue;
		/* merge: eSem = (eSem-1)(0, 94, 96) */
		reached[0][94] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)-1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 47: /* STATE 96 - Man2baton.pml:93 - [t = up] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][96] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.up;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: /* STATE 97 - Man2baton.pml:93 - [up = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][97] = 1;
		(trpt+1)->bup.oval = now.up;
		now.up = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("up", now.up);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: /* STATE 98 - Man2baton.pml:96 - [(((up==0)&(ddown>0)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][98] = 1;
		if (!(((now.up==0)&(now.ddown>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: /* STATE 99 - Man2baton.pml:97 - [t = ddown] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][99] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_1_t;
		((P0 *)this)->_1_t = now.ddown;
#ifdef VAR_RANGES
		logval("Car:t", ((P0 *)this)->_1_t);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 51: /* STATE 100 - Man2baton.pml:97 - [ddown = (t-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][100] = 1;
		(trpt+1)->bup.oval = now.ddown;
		now.ddown = (((P0 *)this)->_1_t-1);
#ifdef VAR_RANGES
		logval("ddown", now.ddown);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 52: /* STATE 101 - Man2baton.pml:98 - [downSem = (downSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][101] = 1;
		(trpt+1)->bup.oval = ((int)now.downSem);
		now.downSem = (((int)now.downSem)+1);
#ifdef VAR_RANGES
		logval("downSem", ((int)now.downSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: /* STATE 104 - Man2baton.pml:100 - [eSem = (eSem+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][104] = 1;
		(trpt+1)->bup.oval = ((int)now.eSem);
		now.eSem = (((int)now.eSem)+1);
#ifdef VAR_RANGES
		logval("eSem", ((int)now.eSem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: /* STATE 120 - Man2baton.pml:137 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][120] = 1;
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

