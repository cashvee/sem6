// Q1: Largest element in array
const arr1 = [10, 25, 5, 40, 15];
let max = arr1[0];

for (let i = 1; i < arr1.length; i++) {
  if (arr1[i] > max) {
    max = arr1[i];
  }
}
console.log("Largest:", max);


// Q2: Remove duplicates
const arr2 = [1, 2, 2, 3, 4, 4, 5];
const unique = [...new Set(arr2)];
console.log("Without duplicates:", unique);


// Q3: Student object
const student = {
  name: "Arjun",
  department: "CSE",

  display: function () {
    console.log("Name:", this.name);
    console.log("Department:", this.department);
  }
};
student.display();


// Q4: Character frequency
const str = "hello";
let freq = {};

for (let char of str) {
  freq[char] = (freq[char] || 0) + 1;
}
console.log("Frequency:", freq);