
long
f()
{
	long r;
	int i;
	
	i = 100;
	r = i;
	return r;
}

int
main()
{
	if (f() > 1000)
		return 1;
	if (f() >= 1000)
		return 1;
	if (1000 < f())
		return 1;
	if (1000 <= f())
		return 1;
	if (1000 == f())
		return 1;
	if (100 != f())
		return 1;
	return 0;
}

