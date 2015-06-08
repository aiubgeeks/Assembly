#include <iostream>
using namespace std;

int *a = new int [1];
int f=0,r=0,z=1;

void print()
{
    cout << "Current queue: ";
    for(int i=f; i<r; i++)
        cout << a[i%z] << " ";
    cout << endl;
}
void resize()
{
    int i;
    int *b = new int [z*2];
    for(i=0,f; f<r; i++,f++)
        b[i] = a[f%z];
    r = i;
    f = 0;
    z = z*2;
    delete []a;
    a = b;
}
void enqueue(int val)   // enqueue
{
    if(r-f>=z-1)
        resize();
    a[r%z] = val;
    r++;
    print();
}
void dequeue()          // dequeue
{
    if(f<r)
        f++;
    else
        cout << "Queue empty!" << endl;
    if(f>=z)
    {
        f = f%z;
        r = r%z;
    }
    print();
}

int main()
{
    enqueue(1);
    enqueue(3);
    enqueue(5);
    enqueue(4);
    enqueue(6);
    enqueue(3);
    enqueue(7);
    enqueue(1);
    enqueue(3);
    enqueue(5);
    enqueue(4);
    enqueue(6);
    enqueue(3);
    enqueue(7);
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    enqueue(1);
    enqueue(3);
    enqueue(5);
    enqueue(4);
    enqueue(6);
    enqueue(3);
    enqueue(7);
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();

    cout << z << endl;

    return 0;
}
