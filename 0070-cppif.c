
#if 1
int x = 0;
#endif

#if 0
int x = 1;
#if 1
 XXXXX
#endif
#endif

int main()
{
	return x;
}
