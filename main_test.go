package main

import (
	"fmt"
	"testing"
)

func TestCalculator(t *testing.T) {
	tests := []struct {
		num1       float64
		num2       float64
		operator   string
		wantResult float64
	}{
		{2.0, 3.0, "+", 5.0},
		{2.0, 3.0, "-", -1.0},
		{2.0, 3.0, "*", 6.0},
		{6.0, 3.0, "/", 2.0},
		{2.0, 3.0, "/", 0.0}, // Division by zero test
		{2.0, 3.0, "%", 0.0}, // Invalid operator test
	}

	for _, tt := range tests {
		testName := fmt.Sprintf("%v %v %v", tt.num1, tt.operator, tt.num2)

		t.Run(testName, func(t *testing.T) {
			gotResult := calculate(tt.num1, tt.num2, tt.operator)

			if tt.wantResult != gotResult {
				t.Errorf("got %v, want %v", gotResult, tt.wantResult)
			}
		})
	}
}

func calculate(num1 float64, num2 float64, operator string) float64 {
	var result float64

	switch operator {
	case "+":
		result = num1 + num2
	case "-":
		result = num1 - num2
	case "*":
		result = num1 * num2
	case "/":
		result = num1 / num2
	default:
		result = 0.0
	}

	return result
}
