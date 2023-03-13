#include <fstream>
#include <vector>
#include <queue>
#include<math.h>
#include <iostream>
using namespace std;

#define inf 0x3f3f3f3f

ifstream fin("graf.in");
ofstream fout("graf.out");

int n, nod, E, dest;
int D[100001], drum[10001];
priority_queue< pair<int, int>, vector< pair<int, int> >, greater< pair<int, int> > > Q;
vector < vector < pair <int, int> > > G(100001);
vector< pair<int, int> > C;
void dijkstra(int nod, int dest) {
    int k = 0;
    drum[0] = nod;
    for (int i = 0; i < n; ++i)
        D[i] = inf;
    D[nod] = 0;
    Q.push({ 0, nod });
    while (!Q.empty()) {
        int dist = Q.top().first;
        nod = Q.top().second;
        Q.pop();
        if (dist > D[nod])
            continue;
        for (auto x : G[nod])
            if (D[x.first] > dist + x.second)
            {
                D[x.first] = dist + x.second;
                Q.push({ D[x.first], x.first });
                k++;
                drum[k] = x.first;
            }
    }
    for (int i = 0; i <= k; ++i)
    {
        if (drum[i] == dest)
        {
            fout << drum[i];
            return;
        }
        else fout << drum[i] << ' ';
    }
        //if (D[dest] == inf) fout << "INF ";
        //else fout << D[dest] << ' ';
}

int main(int argc, char * argv[])
{
    int nod, dest;
    fin >> n >> E;
    cout << "Introduceti nod inceput : "<<endl;
    cin >> nod;
    cout << "Introduceti nod final : " << endl;
    cin >> dest;
    int x, y,c, u, v;
    for (int i = 0; i < n; i++)
    {
        fin >> x >> y;
        C.push_back(make_pair(x,y));
    }
    for (int i = 0; i < E; i++)
    {
        
        fin >> u >> v;
        x = C[v].first - C[u].first;
        y = C[v].second - C[u].second;
        x = pow(x, 2);
        y = pow(y, 2);
        c = sqrt(x + y);
        G[u].push_back({ v, c });
    }
    dijkstra(nod, dest);
    return 0;
}
