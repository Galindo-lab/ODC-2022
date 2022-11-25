// AUTHOR: Luis Eduardo Galindo Amaya
//   DATE: 25-11-2022
//   DESC:


#include <stdio.h>

#define FILAS 4
#define COLUMNAS 3

extern void sumaMatrices(int[FILAS][COLUMNAS], int[FILAS][COLUMNAS],
                         int[FILAS][COLUMNAS], int, int);

void ceros(int A[FILAS][COLUMNAS]) {
  for (int i = 0; i < FILAS; i++) {
    for (int j = 0; j < COLUMNAS; j++)
      A[i][j] = 0;
  }
}

void mostrarMatriz(int A[FILAS][COLUMNAS]) {
  for (int i = 0; i < FILAS; i++) {
    for (int j = 0; j < COLUMNAS; j++) {
      printf("%d ", A[i][j]);
    }
    printf("\n");
  }
}

int main(int argc, char *argv[]) {

  int C[FILAS][COLUMNAS];
  ceros(C);

  int A[FILAS][COLUMNAS] = {
       {1, 2, 3},
       {4, 5, 6},
       {7, 8, 10},
       {7, 8, 10}
  };

  int B[FILAS][COLUMNAS] = {
       {1, 1, 1},
       {1, 1, 1},
       {1, 1, 1},
       {1, 1, 1}
  };

  sumaMatrices(A,B,C,FILAS,COLUMNAS);
  
  mostrarMatriz(C);

  return 0;
}


/* #include <stdio.h> */

/* extern int sumaLista(int* arreglo, int tamano); */

/* int main(){ */
/* 	int arreglo[] = {1,2,3,4,5}; */
/* 	int tamano = 5; */

/* 	int suma = sumaLista(arreglo, tamano); */

/* 	printf("Suma: %d\n", suma); */

/* 	return 0; */
/* } */
