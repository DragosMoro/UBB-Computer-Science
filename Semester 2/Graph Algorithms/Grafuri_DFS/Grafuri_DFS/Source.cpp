#include <iostream>
#include <fstream>
using namespace std;

ifstream fin("graf.txt");

const int MaxN = 102, inf = 9999;
int n, madiacenta[MaxN][MaxN], x, y, s, u, viz[MaxN];


void dfs(int x)
{
    int i;
    viz[x] = 1;
    cout << x << " ";
    for (i = 1; i <= n; i++)
        if (!viz[i] && madiacenta[x][i])
            dfs(i);
}
int main()
{
    fin >> n;
    while (fin >> x >> y)
    {
        madiacenta[x][y] = 1;
    }

    int i, j, k;

    cout << "Matrice adiacenta" << endl;
    for (i = 1; i <= n; i++)
    {
        for (j = 1; j <= n; j++)
            cout << madiacenta[i][j] << " ";
        cout << endl;
    }
    cout << endl;
    dfs(1);

    fin.close();
    return 0;
}