<#start_node_interface#>
//
//  Autogenerated code. Please do not change.
//
//  Copyright © 2018 SoftVision. All rights reserved.
//
//

import UIKit
import Foundation

protocol <#node#> {
    associatedtype <#routes#>
    func shouldPerform(_ connection: <#routes#>) -> Bool
}

extension <#node#> where Self: UIViewController, <#routes#>: RawRepresentable, <#routes#>.RawValue == String {

    /// Navigates to a route
    ///
    /// - Parameter route: The connection to navigate to
    func go(to route: <#routes#>)  {
        performSegue(withIdentifier: route.rawValue, sender: nil)
    }

    /// Default implementation for checking if a route should be invoked
    ///
    /// - Parameter route: The route to follow
    /// - Returns: true if the route is allowed
    func shouldPerform(_ route: <#routes#>) -> Bool {
        return true
    }
}

<#end_node_interface#><#start_lifecycle_code#>// MARK: - <#controller_class#> Lifecycle generated code

extension <#controller_class#> {
    static func instantiateFromStoryboard() -> <#controller_class#> {
        return UIStoryboard(name: "<#storyboard_name#>", bundle: nil).<#start_instantiate_initial#>instantiateInitialViewController()<#end_instantiate_initial#><#start_instantiate_identfier#>instantiateViewController(withIdentifier: "<#view_controller_identifier#>")<#end_instantiate_identfier#> as! <#controller_class#>
    }
}

<#end_lifecycle_code#><#start_navigation_code#>// MARK: - <#controller_class#> navigation generated code

protocol <#controller_class#>Navigation: <#node#> {
<#start_unique_destinations#>    func prepare(forRoute route: <#routes#>, destination: <#destination_controller#>)<#end_unique_destinations#>
}

extension <#controller_class#>: <#controller_class#>Navigation {
    enum <#routes#>: String {
<#start_repeatable#>        case <#case_name#><#end_repeatable#>
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let route = <#routes#>(rawValue: identifier) else {
            return
        }
        switch route {
<#start_repeatable#>        case .<#case_name#>:
<#start_repeatable_custom#>            if let destination = segue.destination as? <#destination_controller#> {
                prepare(forRoute: route, destination: destination)
            }<#end_repeatable_custom#><#start_repeatable_default#>            prepare(forRoute: route, destination: segue.destination)<#end_repeatable_default#><#end_repeatable#>
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let route = <#routes#>(rawValue: identifier) else {
            return false
        }
        return shouldPerform(route)
    }
}

<#end_navigation_code#>
