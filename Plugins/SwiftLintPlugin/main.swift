//
//  main.swift
//  5AMSwiftLint
//
//  BSD 3-Clause License
//  Copyright (c) 2023 Peter Cammeraat (https://5am.is/xcode-project-plugins/)
//

import PackagePlugin
import Foundation

@main
struct SwiftLintPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let arguments = setupArguments(
            directory: context.package.directory.string,
            pluginDirectory: context.pluginWorkDirectory.string
        )
        
        return [
            .buildCommand(
                displayName: "Running SwiftLint for \(target.name)",
                executable: try context.tool(named: "swiftlint").path,
                arguments: arguments,
                environment: [:]
            )
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let arguments = setupArguments(
            directory: context.xcodeProject.directory.string,
            pluginDirectory: context.pluginWorkDirectory.string
        )

        return [
            .buildCommand(
                displayName: "Running SwiftLint for \(target.displayName)",
                executable: try context.tool(named: "swiftlint").path,
                arguments: arguments,
                environment: [:]
            )
        ]
    }
}
#endif

extension SwiftLintPlugin {
    private func setupArguments(directory: String, pluginDirectory: String) -> [String] {
        var arguments = ["lint"]

        let projectSwiftLintFile = "\(directory)/.swiftlint.yml"

        if FileManager.default.fileExists(atPath: projectSwiftLintFile) {
            arguments.append("--config")
            arguments.append(projectSwiftLintFile)
        }

        arguments.append("--cache-path")
        arguments.append("\(pluginDirectory)/cache")
        arguments.append(directory)

        return arguments
    }
}
