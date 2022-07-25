// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import { Socket } from "phoenix"
import topbar from "topbar"
import { LiveSocket } from "phoenix_live_view"

let Hooks = {}
Hooks.RuleGroupHandler = {
    mounted() {
        this.handleEvent("add-rule", ({ index }) => {

            let new_li_body =
                this.labelNome(index)
                + this.inputNome(index)
                + this.conditionsList(index)
                + this.addConditionButton(index)

            let new_li = document.createElement("li")
            console.log(new_li)
            new_li.setAttribute("id", `rule_group[rules][${index}]`)
            new_li.classList = ["rule"]
            new_li.innerHTML = new_li_body
            document.getElementById("rules-container").appendChild(new_li);
        })

        this.handleEvent("add-condition",(params) => console.log(params))
    },
    labelNome(index) {
        return `
        <label
            for="rule-group-forms_rules_${index}_nome"
            name="rule_group[rules][${index}][nome]">
            Nome:
        </label>
            `
    },
    inputNome(index) {
        return `<input 
            type="text"
            id="rule-group-forms_rules_${index}_nome" 
            name="rule_group[rules][${index}][nome]">`
    },
    addConditionButton(index) {
        return `<a href="#" phx-click="add-condition" phx-value-rule-target="${index}"> Add condition </a>`
    },
    conditionsList(index) {
        return `
            <ul id=conditions-container-${index} class="phx-hero condition-container">
                <li id=rule_group[rules][${index}][conditions][0] class="condition">
                    <label type="text" for="rule-group-form_rules_${index}_conditions_0_evaluator">
                        Evaluator
                    </label>
                    <input type="text" name="rule_group[rules][${index}][conditions][0][evaluator]" id="rule-group-form_rules_${index}_conditions_0_evaluator">

                    <label type="text" for="rule-group-form_rules_${index}_conditions_0_operator">
                        Operator
                    </label>
                    <input type="text" name="rule_group[rules][${index}][conditions][0][operator]" id="rule-group-form_rules_${index}_conditions_0_operator">

                    <label type="text" for="rule-group-form_rules_${index}_conditions_0_value">
                        Value
                    </label>
                    <input type="text" name="rule_group[rules][${index}][conditions][0][value]" id="rule-group-form_rules_${index}_conditions_0_value">
                </li>
            </ul>
            `
    }

}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } })

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

