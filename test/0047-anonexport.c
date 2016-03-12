
typedef struct {
	int x;
	union {
		int b;
		int c;
	};
	struct {
		int d;
	};
} s;

int
main()
{
	s v;
	
	v.x = 1;
	v.b = 2;
	v.d = 3;
	
	if (v.x != 1)
		return 1;
	if (v.b != 2 && v.c != 2)
		return 2;
	if (v.d != 3)
		return 3;
	
	return 0;
}
