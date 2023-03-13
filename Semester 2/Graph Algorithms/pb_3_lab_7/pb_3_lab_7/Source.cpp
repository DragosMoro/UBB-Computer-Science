#include <iostream>
#include <fstream>
using namespace std;

ifstream f("1.in");
ofstream g("1.out");

int V, E, adj[1021][1021], viz[1021];

void removeEdge(int x, int y)
{
    adj[x][y] = adj[y][x] = 0;
}

void addEdge(int a, int b)
{
    adj[a][b] = adj[b][a] = 1;
}

int DFScount(int start)
{
    viz[start] = 1;
    int c = 1;
    for (int i = 0; i < V; i++)
    {
        if (viz[i] == 0 && adj[start][i] == 1)
            c += DFScount(i);
    }
    return c;
}
int isBridge(int x, int y)
{
    for (int i = 0; i < V; i++)
        viz[i] = 0;
    int nr = 0;
    for (int j = 0; j < V; j++)
        if (adj[x][j] == 1)
            nr++;
    if (nr == 1) return 0;  ///daca x are un singur vecin muchia nu este punte

    int cnt1 = DFScount(x);
    removeEdge(x, y);

    for (int i = 0; i < V; i++)
        viz[i] = 0;
    int cnt2 = DFScount(x);
    addEdge(x, y);
    if (cnt1 == cnt2) return 0;  ///muchia x-y nu este muchie punte
    return 1;  ///muchia x-y este muchie punte (daca am elimina-o am obtine 2 componente conexe in graf)

}

void Fleury(int start)
{
    int gasit = 0;
    for (int x = 0; x < V; x++)
    {
        if (adj[start][x] == 1)
        {
            gasit = 1;
            if (!isBridge(start, x))
            {
                g << start << " ";
                removeEdge(start, x);
                Fleury(x);
            }
        }
    }
    if (gasit == 0) g << start;
}
int main()
{
    int x, y;
    f >> V >> E;
    for (int i = 1; i <= E; i++)
    {
        f >> x >> y;
        adj[x][y] = adj[y][x] = 1;
    }
    Fleury(0);
    return 0;
}