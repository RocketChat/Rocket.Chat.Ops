# LF Webhook Router - a patterned k8s orchestration

This is a reusable, composable, parameterized k8s orchestration for high availability, high performance, high volume webhooks routing.

First FOSS k8s orchestration on github (github does not yet have a project type for k8s orchestrations).

Originally conceptualized by @lee.faus

It is a pure Dev Ops coded component.  To be used for massively scaling Rocket.Chat.Ops.

#### Capacity objective

from 1,000 webhooks per second, routing to 10,000 rooms, sustained 1 hr

TO

10,000 webhooks per second, routing to 100,000 rooms, sustained 1 hr

#### Performance objective

worse case route under 10 ms

