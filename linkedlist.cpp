#include <iostream>
using namespace std;

#define sz 100

int data[sz], List[sz];
int start = -1;

void init()
{
    for(int i=0; i < sz; i++)
        List[i] = -2;
}

void print()
{
    cout << "Current array: ";
    for(int i=start; i!=-1; i=List[i])
        cout << data[i] << " ";
    cout << endl;
}

int find_empty()
{
    for(int i=0; i<sz; i++)
        if(List[i]==-2)
            return i;
    return -1;
}

void push(int val)
{
    int idx, i;

    idx = find_empty();

    if(start==-1)
        start = idx;

    i = start;

    while( List[i]>-1 )
        i = List[i];

    data[idx] = val;
    List[i] = idx;
    List[idx] = -1;
    print();
}

void Insert(int k, int val) // 0 based index
{
    int idx, temp, cnt=1;

    temp = find_empty();

    if(k==0)
    {
        data[temp] = val;
        List[temp] = List[start];
        start = temp;
    }
    else
    {
        idx = start;

        while( cnt<k )
        {
            idx = List[idx];
            cnt++;
        }

        data[temp] = val;
        List[temp] = List[idx];
        List[idx] = temp;
    }
    print();
}

int main()
{
    init();

    push(5);
    push(7);
    push(4);
    push(3);
    push(9);
    Insert(2,1);
    push(4);
    push(3);
    push(9);
    Insert(3,10);
    push(4);
    push(3);
    push(9);
    Insert(13,12);

    return 0;
}
