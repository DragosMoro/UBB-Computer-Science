#include <fstream>
#include <queue>
#include <string.h>
using namespace std;

ifstream fin("1.in");
ofstream fout("1.out");

int V, E, x, y, w;
int G[1001][1001], GR[1001][1001], T[1001];

bool bfs(int s, int t)
{
    bool visited[101];
    memset(visited, 0, sizeof(visited));
    queue<int> q;
    q.push(s);
    visited[s] = true;
    T[s] = -1;
    while (!q.empty())
    {
        int u = q.front();
        q.pop();
        for (int v = 0; v < V; v++)
            if (!visited[v] && GR[u][v] > 0)
            {
                if (v == t) { T[v] = u; return true; }
                q.push(v);
                T[v] = u;
                visited[v] = true;
            }
    }
    return false;
}

int fordFulkerson(int G[][1001], int s, int t)
{
    for (int i = 0; i < V; i++)
        for (int j = 0; j < V; j++)
            GR[i][j] = G[i][j];

    int flux_max = 0;
    int v, i;
    while (bfs(s, t))
    {
        int drum_flux = INT_MAX;
        for (v = t; v != s; v = T[v])
        {
            i = T[v];
            drum_flux = min(drum_flux, GR[i][v]);
        }
        for (v = t; v != s; v = T[v])
        {
            i = T[v];
            GR[i][v] -= drum_flux;
            GR[v][i] += drum_flux;
        }
        flux_max += drum_flux;
    }
    return flux_max;
}


int main()
{
    fin >> V >> E;
    for (int i = 1; i <= E; i++)
    {
        fin >> x >> y >> w;
        G[x][y] = w;
    }
    fout << fordFulkerson(G, 0, V - 1);
    return 0;
}
