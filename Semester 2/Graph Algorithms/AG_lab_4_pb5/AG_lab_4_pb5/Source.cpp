#include <fstream>
#include <algorithm>
using namespace std;

ifstream fin("fis.in");
ofstream fout("fis.out");

struct muchie
{
    int i, j, c;
}M[100001];

muchie A[100001];

int n, m, x, y, w, T[100001], cost_min, cnt=0;

int comp(muchie a, muchie b)
{
    return a.c < b.c;
}

int comp_(muchie a, muchie b)
{
    if (a.i < b.i) return 1;
    else if (a.i == b.i && a.j < b.j) return 1;
    else return 0;
}

int radacina(int a)
{
    if (a == T[a]) return a;
    else return T[a] = radacina(T[a]);
}

void kruskal()
{
    int r1, r2;
    for (int i = 1; i <= m; i++)
    {
        r1 = radacina(M[i].i);
        r2 = radacina(M[i].j);
        if (r1 != r2)
        {
            cost_min += M[i].c;
            A[++cnt] = M[i];
            T[r1] = T[r2];
        }
    }
}


int main()
{
    int x1, y1;
    fin >> n ;
    for (int i = 1; i <= n; i++)
    {
        fin >> x >> y;
        for (int j = 1; j <= n; j++)
        {
            fin >> x1 >> y1;
            M[i].i = i;
            M[i].j = j;
            M[i].c = sqrt(x*x-x1*x1)
        }
     
    }
    sort(M + 1, M + m + 1, comp);
    for (int i = 1; i <= n; i++)
        T[i] = i;
    kruskal();
    fout <<"Cost minim: "<< cost_min << '\n';
    fout <<"Nr muchii: " << n - 1 << '\n';
    sort(A + 1, A + n, comp_);
    for (int i = 1; i < n; i++)
        fout << A[i].i << " " << A[i].j << '\n';
}

