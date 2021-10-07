# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project's packages adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added required annotation for new config system.

## [0.6.0] - 2021-09-10

### Changed

- Bump to upstream version 1.8.3
- Added support for CAPZ clusters by detecting the Azure configuration file location.

## [0.5.0] - 2021-03-09

### Fixed

- Fix missing 'v' in tags

## [0.4.1] - 2021-03-09

### Fixed

- Fix PSP capabilities to allow it to work on management clusters

## [0.4.0] - 2021-03-09

### Changed

- Update chart to 3.0.3
- Allow more configuration options to work by default with CAPZ (Cluster API Provider Azure)

## [0.3.0] - 2021-03-09

### Changed

- Upgrade to 1.7.4

## [v0.2.1]

### Changed
- Move giantswarm.io/monitoring annotation to label

## [v0.2.0]

### Added

- Exposing prometheus services for scrapping.
- Basic documentation to explain what the application does.

## [v0.1.0]

### Added

- Add first version of the Azure AD Pod Identity App.

[Unreleased]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.6.0...HEAD
[0.6.0]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/giantswarm/azure-ad-pod-identity-app/compare/v0.2.1...v0.3.0
[v0.2.1]: https://github.com/giantswarm/prometheus-meta-operator/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/giantswarm/prometheus-meta-operator/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/giantswarm/azure-ad-pod-identity-app/releases/tag/v0.1.0
