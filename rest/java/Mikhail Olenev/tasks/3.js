let [n, m] = [parseInt(prompt('n:')), parseInt(prompt('m:'))]; //Объявление и ввод
//Создаём массив matr и c_matr, в который мы будем копировать первый массив
let [matr, c_matr] = [new Array(n), new Array(n)]; 

//Начало вложенного цикла
for (let i = 0; i < n; i++) {
    //Делаем массив в массиве (я не смогу в двух словах сказать)
    //https://ru.stackoverflow.com/q/547180
    c_matr[i] = new Array(m);
    matr[i] = new Array(m);
    for (let j = 0; j < m; j++)
        matr[i][j] = prompt(`Матрица 1, ячейка [${i}, ${j}]`);
}

//Разворот матрицы на 90° против часовой стрелки
for (let i = 0; i < n; i++) 
    for (let j = 0; j < n; j++)
        c_matr[i][j] = matr[j][m-i-1];

//join позволяет разделять строки в матрице
alert(c_matr.join('\n'));