package main

import (
	"fmt"
	"strings"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://app.binds.co/api/seeds"

	payload := strings.NewReader("{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Ezequias Dinella\",\"email\":\"ezequias@binds.co\"}}")

	req, _ := http.NewRequest("POST", url, payload)

	req.Header.Add("content-type", "application/json; charset=UTF-8")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
