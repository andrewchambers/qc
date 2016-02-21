
int
main()
{
	/* XXX test waiting for struct tags */
	struct { int x; int y; } s;
	struct { int x; int y; } *p;

	p = &s;	
	s.x = 1;
	p->y = 2;
	return p->y + p->x - 3; 
}

