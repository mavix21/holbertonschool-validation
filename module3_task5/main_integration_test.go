package main

import (
	//nolint:staticcheck
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func Test_server(t *testing.T) {
	if testing.Short() {
		t.Skip("Flag `-short` provided: skipping Integration Tests.")
	}

	tests := []struct {
		name         string
		URI          string
		responseCode int
		body         string
	}{
		{
			name:         "Home page no slash",
			URI:          "",
			responseCode: 200,
			body:         "",
		},
		{
			name:         "Home page with slash",
			URI:          "/",
			responseCode: 200,
			body:         "",
		},
		{
			name:         "Hello page",
			URI:          "/hello?name=Holberton",
			responseCode: 200,
			body:         "Hello Holberton!",
		},
		{
			name:         "Health page",
			URI:          "/health",
			responseCode: 200,
			body:         "ALIVE",
		},
		{
			name:         "Rosalind Franklin",
			URI:          "/hello?name=Rosalind Franklin",
			responseCode: 400,
			body:         "400 Bad Request",
		},
		{
			name:         "John%20Doe",
			URI:          "/hello?name=John%20Doe",
			responseCode: 200,
			body:         "Hello John Doe!",
		},
		{
			name:         "Foo+Bar",
			URI:          "/hello?name=Foo+Bar",
			responseCode: 200,
			body:         "Hello Foo Bar!",
		},
		{
			name:         "Parameter without a value 1",
			URI:          "/hello?name",
			responseCode: 400,
			body:         "",
		},
		{
			name:         "Parameter without a value 2",
			URI:          "/hello?name=",
			responseCode: 400,
			body:         "",
		},
		{
			name:         "Parameter without a value 3 (but actually works?)",
			URI:          "/hello?name?",
			responseCode: 200,
			body:         "Hello there!",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ts := httptest.NewServer(setupRouter())
			defer ts.Close()

			res, err := http.Get(ts.URL + tt.URI)
			if err != nil {
				t.Fatal(err)
			}

			// Check that the status code is what you expect.
			expectedCode := tt.responseCode
			gotCode := res.StatusCode
			if gotCode != expectedCode {
				t.Errorf("handler returned wrong status code: got %q want %q", gotCode, expectedCode)
			}

			// Check that the response body is what you expect.
			expectedBody := tt.body
			if expectedBody == "" {
				return
			}

			bodyBytes, err := ioutil.ReadAll(res.Body)
			res.Body.Close()
			if err != nil {
				t.Fatal(err)
			}
			gotBody := string(bodyBytes)
			if gotBody != expectedBody {
				t.Errorf("handler returned unexpected body: got %q want %q", gotBody, expectedBody)
			}
		})
	}
}
