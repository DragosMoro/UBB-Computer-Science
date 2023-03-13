#include <iostream>
#include <fstream>
#include <climits>
#include <vector>
using namespace std;
ifstream in("a.in");
vector<pair<int, int>>G[10005];
int n, d[10005], viz[10005], parinte[10005], drum[100005], distanta[10005];
int Bellman_Ford(int start)
{
    int i, nodcurent, j; 
    for (i = 0; i < n; i++)
        d[i] = INT_MAX / 2;
    parinte[start] = 0;
    d[start] = 0;
    viz[start] = 0;
    distanta[start] = 0;
    for (i = 0; i < n - 1; i++)
    {
        for (nodcurent = 0; nodcurent < n; nodcurent++)
        {
            for (j = 0; j < G[nodcurent].size(); j++)
            {
                int v = G[nodcurent][j].first;
                int p = G[nodcurent][j].second;
                if (d[nodcurent] + p < d[v] && d[nodcurent] != INT_MAX / 2)
                {
                    distanta[v] = distanta[nodcurent] + 1;
                    d[v] = d[nodcurent] + p;
                    parinte[v] = nodcurent;
                }
            }
        }
    }
    for (nodcurent = 0; nodcurent < n; nodcurent++)
    {
        for (j = 0; j < G[nodcurent].size(); j++)
        {
            int v = G[nodcurent][j].first;
            int p = G[nodcurent][j].second;
            if (d[nodcurent] + p < d[v] && d[nodcurent] != INT_MAX / 2)
                return false;
        }
    }
    return true;
}
void minim(int stop)
{
    int k = distanta[stop];
    drum[k] = stop;
    while (k)
    {
        drum[k - 1] = parinte[drum[k]];
        k--;
    }
}
int main()
{
    int start, stop, x, y, w, i;
    in >> n;
    in >> start >> stop;
    while (in >> x >> y >> w)
    {
        G[x].push_back(make_pair(y, w));
    }
    if (Bellman_Ford(start))
    {
        if (distanta[stop] != 0)
        {
            minim(stop);
            cout << "Drumul este: ";
            for (i = 0; i <= distanta[stop]; i++)
                cout << drum[i] << " ";
        }
        else
            cout << "Nu poate sa ajunga";
    }
    else
    {
        cout << "Exista cicluri negative";
    }
    return 0;
}
